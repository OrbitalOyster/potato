<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faSpinner } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
    icon?: object
    loading?: boolean
    submit?: boolean
    title: string
  }>(),
  type = props.submit ? 'submit' : 'button'
</script>

<template>
  <button
    :type
    class="focusable"
  >
    {{ title }}
    <FontAwesomeIcon
      v-if="icon || loading"
      :class="{ 'fa-pulse': loading }"
      :icon="loading ? faSpinner : icon!"
      size="lg"
    />
  </button>
</template>

<style scoped lang="sass">
  @use '../assets/borders'
  @use '../assets/colors'
  @use '../assets/transitions'

  button
    align-items: center
    background-color: colors.$primary
    border-radius: borders.$radius
    border: none
    color: colors.$button
    cursor: pointer
    display: flex
    filter: drop-shadow(colors.$button-shadow 0 0 .1rem)
    font-size: 1.25rem
    gap: .75rem
    height: 3.5rem
    padding-left: 1rem
    padding-right: 1rem
    transform: translateY(0)
    transition: transitions.$focusable, transitions.$colors, transitions.$filter, transitions.$transform
    user-select: none

  button:enabled
    filter: drop-shadow(colors.$button-shadow 0 .16rem .1rem)

  button:hover:enabled
    filter: drop-shadow(colors.$button-shadow 0 .28rem .2rem)
    transform: translateY(-.1rem)

  button:active:enabled
    background-color: colors.$active
    filter: drop-shadow(colors.$button-shadow 0 .16rem .1rem)
    transform: translateY(0)

  button:disabled
    background-color: colors.$disabled-primary
    color: colors.$disabled
</style>
