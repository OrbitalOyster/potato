<script setup lang="ts">
import { autoUpdate, hide, size, useFloating } from '@floating-ui/vue'
import { ref, useTemplateRef, watch } from 'vue'
import type { FormCheck } from '#stores/formStore.ts'
import { useFormStore } from '#stores/useFormStore.ts'

import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faChevronDown } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
    checks?: FormCheck[]
    disabled?: boolean
    name: string
    options: string[]
    placeholder: string
    storeId: string
  }>(),
  store = useFormStore(props.storeId),
  active = ref(false),
  optionsRef = useTemplateRef('optionsRef'),
  placement = 'bottom',
  maxDistanceToBottom = 32,
  minHeight = 128,
  selectedIndex = ref<null | number>(null),
  scrollToSelected = (instant: boolean) => {
    if (selectedIndex.value !== null) {
      const highlightedElement = optionsRef.value?.[selectedIndex.value],
        behavior = instant ? 'instant' : 'smooth'
      highlightedElement?.scrollIntoView({ behavior, block: 'center' })
    }
  },
  setValue = (value: number | null) => {
    selectedIndex.value = value
    /* Resetting value? */
    if (value === null) {
      store.inputs[props.name] = ''
    }
    else {
      store.inputs[props.name] = props.options[value]
    }
    store.validate()
  },
  wrap = (value: number, direction: number) =>
    (value + direction + props.options.length) % props.options.length,
  // eslint-disable-next-line no-useless-assignment
  keyScroll = (direction: number) => {
    /* Edge case - nothing selected */
    selectedIndex.value ??= (direction > 0 ? -1 : 0)
    setValue(wrap(selectedIndex.value, direction))
    if (active.value) {
      scrollToSelected(false)
    }
  },
  target = useTemplateRef('target'),
  floating = useTemplateRef('floating'),
  // eslint-disable-next-line no-useless-assignment
  { floatingStyles, isPositioned } = useFloating(target, floating, {
    placement,
    open: active,
    middleware: [
      size({
        apply({ availableHeight, rects, elements }) {
          const maxHeight = Math.max(minHeight, availableHeight - maxDistanceToBottom),
            { width } = rects.reference
          Object.assign(elements.floating.style, {
            maxHeight: `${maxHeight.toString()}px`,
            width: `${width.toString()}px`,
          })
        },
      }),
      hide(),
    ],
    whileElementsMounted: autoUpdate,
  })
watch(isPositioned, (opened) => {
  if (opened) {
    scrollToSelected(true)
  }
},
)
store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = ''
</script>

<template>
  <div
    class="wrapper"
  >
    <input
      v-model="store.inputs[props.name]"
      :name
      :placeholder
    >
    <div
      ref="target"
      class="target"
      :class="store.errors[props.name] ? 'invalid' : 'valid'"
      :tabindex="disabled ? -1 : 0"
      @blur="e => active = active && e.relatedTarget === floating"
      @click="active = !active"
      @keydown.up="keyScroll(-1)"
      @keydown.down="keyScroll(1)"
      @keydown.enter="active = !active"
      @keydown.esc="active = false"
    >
      {{ store.inputs[props.name] }}
    </div>
    <label class="form-input-label">
      {{ placeholder }}
    </label>
    <div class="input-icons">
      <div
        class="text-slate-500 transition-[transform]"
        :class="{ 'rotate-180': active }"
      >
        <FontAwesomeIcon
          :icon="faChevronDown"
          size="xl"
        />
      </div>
    </div>
    <Transition name="fade">
      <ul
        v-if="active"
        ref="floating"
        tabindex="0"
        class="card absolute mt-2 z-50 overflow-y-auto"
        :style="floatingStyles"
        @focus="target?.focus()"
      >
        <li
          v-for="(option, i) in options"
          ref="optionsRef"
          :key="i"
          class="p-2 cursor-pointer select-none"
          :class="selectedIndex === i && 'bg-slate-200' || 'hover:bg-slate-100'"
          @click="setValue(i); active = false"
        >
          {{ option }}
        </li>
      </ul>
    </Transition>
  </div>
</template>

<style lang="sass" scoped>
  @use '../assets/style'

  .wrapper
    display: flex
    justify-items: center
    position: relative

  input
    display: none

  .target
    @extend .focusable
    @extend .form-input

    display: flex
    align-items: center
    width: 100%
    padding: .5rem
    height: 3rem
    user-select: none
    cursor: pointer

  .form-input-label
    position: absolute
    top: 1rem
    left: 1rem
    user-select: none
    pointer-events: none

  /* Shrink and translate label if:
   * - input is focused
   * - placeholder not shown
   * - input is not empty */
  .form-input[placeholder]:focus + .form-input-label,
  .form-input[placeholder]:not(:placeholder-shown) + .form-input-label,
  .form-input:not(:empty) + .form-input-label
    transform: translateY(calc(-50%)) scale(.8)
</style>
