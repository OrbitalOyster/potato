<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faSpinner } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
    icon?: string
    loading?: boolean
    submit?: boolean
    title: string
  }>(),
  type = props.submit ? 'submit' : 'button'
</script>

<template>
  <button
    :type
  >
    <div class="wrapper">
      {{ title }}
      <FontAwesomeIcon
        v-if="icon || loading"
        :class="loading && 'fa-pulse'"
        :icon="loading ? faSpinner : icon!"
        size="lg"
      />
    </div>
  </button>
</template>

<style scoped lang="sass">
  @use '../assets/borders'
  @use '../assets/colors'
  @use '../assets/style'
  @use '../assets/transitions'

  button
    @extend .focusable
    background-color: colors.$primary
    border-radius: borders.$radius
    border: none
    color: colors.$button
    cursor: pointer
    font-size: 1.25rem
    padding: .75rem
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

  .wrapper
    align-items: center
    display: flex
    filter: drop-shadow(colors.$button-shadow 0 0 .1rem)
    gap: .75rem
    height: 2rem
</style>
