<script setup lang="ts">
defineProps<{
  disabled?: boolean
  name: string
  title?: string
  checked?: boolean
}>()

const model = defineModel<boolean>()
</script>

<template>
  <input
    v-model="model"
    type="checkbox"
    :name
  >
  <div
    class="wrapper"
  >
    <button
      :id="name"
      :disabled
      type="button"
      @click="model = !model"
    >
      <div
        v-if="model"
        class="mark"
      />
    </button>
    <label
      v-if="title"
      :for="name"
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
