<script setup lang="ts">
import type { MyFormCheck } from '#stores/useFormStore.ts'
import { useFormStore } from '#stores/useFormStore.ts'

const props = defineProps<{
    name: string
    title: string
    checked?: boolean
    disabled?: boolean
    storeId: string
    checks?: MyFormCheck[]
  }>(),
  store = useFormStore(props.storeId)

function toggle(params) {
  store.inputs[props.name] = !store.inputs[props.name]
}

store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = props.checked || false
</script>

<template>
  <input
    v-model="store.inputs[props.name]"
    type="checkbox"
    :name
  >
  <div
    class="wrapper"
  >
    <button
      :id="`${storeId}-${props.name}`"
      type="button"
      :disabled
      class="active:bg-emerald-500"
      @click="toggle"
    >
      <div
        v-if="store.inputs[props.name]"
        class="mark"
      />
    </button>
    <label
      :for="`${storeId}-${props.name}`"
    >
      {{ title }}
    </label>
  </div>
</template>

<style scoped lang="sass">
  @use '../assets/style'
  @use '../assets/colors'

  input
    display: none

  .wrapper
    display: flex
    gap: .5rem
    align-items: center

  button
    @extend .focusable
    position: relative
    border: 1px solid black
    border-radius: .4rem
    width: 1.5rem
    height: 1.5rem
    cursor: pointer
    transition: style.$focusable-transition

  .mark
    position: absolute
    top: .2rem
    left: .2rem
    width: 1rem
    height: 1rem
    background-color: colors.$active
    border-radius: .3rem

  label
    user-select: none
    cursor: pointer

</style>
