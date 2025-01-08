<script setup lang="ts">
import type { FormCheck } from '#stores/useFormStore.ts'
import { useFormStore } from '#stores/useFormStore.ts'

const props = defineProps<{
    checked?: boolean
    checks?: FormCheck[]
    disabled?: boolean
    formId: string
    name: string
    title?: string
  }>(),
  store = useFormStore(props.formId)

store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = props.checked || false
</script>

<template>
  <input
    v-model="store.inputs[name]"
    type="checkbox"
    :name
  >
  <div
    class="wrapper"
  >
    <button
      :id="`${formId}-${name}`"
      :disabled
      type="button"
      @click="store.inputs[name] = !store.inputs[name]"
    >
      <div
        v-if="store.inputs[name]"
        class="mark"
      />
    </button>
    <label
      v-if="title"
      :for="`${formId}-${name}`"
    >
      {{ title }}
    </label>
  </div>
</template>

<style scoped lang="sass">
  @use '../assets/borders'
  @use '../assets/colors'
  @use '../assets/style'
  @use '../assets/transitions'

  input
    display: none

  .wrapper
    align-items: center
    display: flex
    gap: .5rem

  button
    @extend .form-input
    @extend .focusable
    cursor: pointer
    height: 1.75rem
    position: relative
    transition: transitions.$focusable, transitions.$colors
    width: 1.75rem

  button:active:enabled
    background-color: colors.$active

  .mark
    background-color: colors.$primary
    border-radius: borders.$radius
    height: .9rem
    left: .38rem
    position: absolute
    top: .38rem
    width: .9rem

  button:disabled .mark
    background-color: colors.$disabled-primary

  label
    cursor: pointer
    user-select: none
</style>
