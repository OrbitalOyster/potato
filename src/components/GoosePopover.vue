<script setup lang="ts">
import { arrow, autoUpdate, flip, hide, offset, shift, size, useFloating } from '@floating-ui/vue'
import { computed, ref, useTemplateRef } from 'vue'
import type { Placement } from '@floating-ui/utils'

const props = defineProps<{
    hasArrow?: boolean
    clickToggle?: boolean
    placement: Placement
  }>(),
  active = ref(false),
  target = useTemplateRef('target'),
  floating = useTemplateRef('floating'),
  arrowRef = useTemplateRef('arrowRef')

const minSize = 256,
  offsetValue = props.hasArrow ? 16 : 2

/* Floating UI */
const { floatingStyles, middlewareData } = useFloating(target, floating, {
  open: active,
  placement: props.placement,
  middleware: [
    offset({ mainAxis: offsetValue }),
    flip(),
    shift({ padding: 16 }),
    arrow({ element: arrowRef, padding: 4 }),
    size({
      apply({ availableWidth, availableHeight, elements }) {
        Object.assign(elements.floating.style, {
          maxWidth: `${Math.max(minSize, availableWidth).toString()}px`,
          maxHeight: `${Math.max(minSize, availableHeight).toString()}px`,
        })
      },
    }),
    hide(),
  ],
  whileElementsMounted: autoUpdate,
})

/* Arrow */
const arrowStyle = computed(
  () => {
    const side = middlewareData.value.offset?.placement.split('-')[0] ?? 'bottom',
      /* Rotate rectangle, shape it into an arrow */
      rotation = { top: -135, right: -45, bottom: 45, left: 135 }[side] ?? 0,
      floatingWidth = floating.value?.offsetWidth ?? 0,
      floatingHeight = floating.value?.offsetHeight ?? 0,
      leftOffset = side === 'left' ? 1 : 0,
      topOffset = side === 'top' ? 1 : 0,
      middlewareArrow = middlewareData.value.arrow,
      arrowOffset = 9
    return {
      transform: `rotate(${rotation.toString()}deg)`,
      left: middlewareArrow?.x || middlewareArrow?.x === 0
        ? `${middlewareArrow.x.toString()}px`
        : `${(floatingWidth * leftOffset - arrowOffset).toString()}px`,
      top: middlewareArrow?.y || middlewareArrow?.y === 0
        ? (`${middlewareArrow.y.toString()}px`)
        : `${(floatingHeight * topOffset - arrowOffset).toString()}px`,
    }
  })

function toggle() {
  active.value = !active.value
}

defineExpose({ toggle, active })
</script>

<template>
  <div
    ref="target"
    class="target"
    @click="props.clickToggle && toggle()"
  >
    <slot />
  </div>
  <Transition name="fade">
    <div
      v-if="active"
      ref="floating"
      class="floating"
      :style="floatingStyles"
    >
      <div
        v-if="props.hasArrow"
        ref="arrowRef"
        :style="arrowStyle"
        class="arrow"
      />
      <div class="popover">
        <slot name="popover" />
      </div>
    </div>
  </Transition>
</template>

<style lang="sass" scoped>
  @use '../assets/borders.sass'
  @use '../assets/colors.sass'
  @use '../assets/style.sass'
  @use '../assets/transitions.sass'

  .target
    display: inline-block

  .arrow
    background-color: colors.$card
    border-left: borders.$card
    border-top: borders.$card
    clip-path: polygon(0% 0%, 100% 0%, 0% 100%, 0% 0%)
    height: 16px
    position: absolute
    width: 16px

  .floating
    @extend .card
    left: 0
    position: absolute
    top: 0

  .popover
    height: inherit
    overflow: auto
    width: inherit
</style>
