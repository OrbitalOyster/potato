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

function toggle() {
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
    @extend .form-input
    @extend .focusable
    position: relative
    padding: 0
    width: 1.75rem
    height: 1.75rem
    cursor: pointer
    transition: background-color 100ms ease-in-out, style.$focusable-transition

  button:active:enabled
    background-color: colors.$active

  .mark
    position: absolute
    top: .33rem
    left: .33rem
    width: 1rem
    height: 1rem
    background-color: colors.$primary
    border-radius: 25%

  button:disabled .mark
    background-color: colors.$disabled-primary

  label
    user-select: none
    cursor: pointer

</style>
