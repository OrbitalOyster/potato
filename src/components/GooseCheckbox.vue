<script setup lang="ts">
import { nextTick } from 'vue'

defineProps<{
  disabled?: boolean
  name: string
  title?: string
}>()

const model = defineModel<boolean | null>(),
  emit = defineEmits(['update'])

async function onClick() {
  model.value = !model.value
  await nextTick() /* Gotta wait for DOM */
  emit('update', model.value)
}
</script>

<template>
  <input
    v-model="model"
    :name
    type="checkbox"
  >
  <div
    class="wrapper"
  >
    <button
      :id="name"
      :disabled
      type="button"
      @click="onClick"
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
    height: v-bind("model === null ? '.35rem' : '.9rem'")
    left: .35rem
    position: absolute
    top: v-bind("model === null ? '.65rem' : '.35rem'")
    width: .9rem

  button:disabled .mark
    background-color: colors.$disabled-primary

  label
    cursor: pointer
    user-select: none
</style>
