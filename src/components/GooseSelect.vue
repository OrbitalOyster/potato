<script setup lang="ts">
import { autoUpdate, hide, size, useFloating } from '@floating-ui/vue'
import { ref, useTemplateRef, watch } from 'vue'
import type { FormCheck } from '#stores/useFormStore.ts'
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
  if (opened)
    scrollToSelected(true)
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
    <label>
      {{ placeholder }}
    </label>
    <div class="input-icons">
      <FontAwesomeIcon
        :icon="faChevronDown"
        size="xl"
      />
    </div>
    <Transition name="fade">
      <ul
        v-if="active"
        ref="floating"
        tabindex="0"
        :style="floatingStyles"
        @focus="target?.focus()"
      >
        <li
          v-for="(option, i) in options"
          ref="optionsRef"
          :key="i"
          :class="selectedIndex === i && 'selected'"
          @click="setValue(i); active = false"
        >
          {{ option }}
        </li>
      </ul>
    </Transition>
  </div>
</template>

<style lang="sass" scoped>
  @use '../assets/colors'
  @use '../assets/style'
  @use '../assets/transitions'

  .wrapper
    display: flex
    justify-items: center
    position: relative

  input
    display: none

  .target
    @extend .focusable
    @extend .form-input

    align-items: center
    cursor: pointer
    display: flex
    height: 2rem
    padding: 1.5rem 1rem .25rem 1rem
    user-select: none
    width: 100%
    transition: transitions.$focusable, transitions.$colors

  label
    color: colors.$input-label
    left: 1rem
    pointer-events: none
    position: absolute
    top: 1.25rem
    transform-origin: left
    user-select: none
    transition: transitions.$transform

  /* Shrink and translate label if:
   * - input is focused
   * - placeholder not shown
   * - input is not empty */
  .form-input[placeholder]:focus + label,
  .form-input[placeholder]:not(:placeholder-shown) + label,
  .form-input:not(:empty) + label
    transform: translateY(calc(-70%)) scale(.9)

  .input-icons
    align-items: center
    display: inline-flex
    height: 100%
    pointer-events: none
    position: absolute
    right: 1rem
    user-select: none

  ul
    @extend .card
    margin-top: .5rem
    overflow-y: auto
    padding: 0
    position: absolute
    z-index: 99

  li
    display: block
    padding: 1rem
    cursor: pointer
    user-select: none

  li:hover
    background-color: #EAECEE

  li.selected
    background-color: #D5D8DC
</style>
