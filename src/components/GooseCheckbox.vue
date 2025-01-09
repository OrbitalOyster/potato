<script setup lang="ts">

const props = defineProps<{
  disabled?: boolean
  name: string
  title?: string
}>()

const model = defineModel<boolean | null>()
</script>

<template>
  <input
    :name
    type="checkbox"
    v-model="model"
  >
  <div
    class="wrapper"
  >
    <button
      :disabled
      :id="name"
      @click="model = !model"
      type="button"
    >
      <div
        v-if="model !== false"
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
    height: v-bind("model === null ? '.55rem' : '.9rem'")
    left: .38rem
    position: absolute
    top: v-bind("model === null ? '.55rem' : '.38rem'")
    width: .9rem

  button:disabled .mark
    background-color: colors.$disabled-primary

  label
    cursor: pointer
    user-select: none
</style>
