<script setup lang="ts">

import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faSpinner } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
    title: string
    icon?: string
    submit?: boolean
    loading?: boolean
  }>(),
  type = props.submit ? 'submit' : 'button'

</script>

<template>
  <button
    :type
  >
    <div>
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
  @use '../assets/style'
  @use '../assets/borders'
  @use '../assets/colors'

  $transition-params: 100ms ease-in-out
  $transition-colors: background-color $transition-params

  button
    @extend .focusable
    padding: .75rem
    border: none
    border-radius: borders.$radius
    font-size: 1.25rem
    color: colors.$button
    background-color: colors.$primary
    transform: translateY(0)
    transition: $transition-colors, style.$focusable-transition, filter $transition-params, transform $transition-params
    cursor: pointer
    user-select: none

  button:enabled
    filter: drop-shadow(colors.$button-shadow 0 .16rem .1rem)

  button:hover:enabled
    transform: translateY(-.1rem)
    filter: drop-shadow(colors.$button-shadow 0 .28rem .2rem)

  button:active:enabled
    background-color: colors.$active
    transform: translateY(0)
    filter: drop-shadow(colors.$button-shadow 0 .16rem .1rem)

  button:disabled
    color: colors.$disabled
    background-color: colors.$disabled-primary

  div
    display: flex
    height: 2rem
    align-items: center
    gap: .75rem
    filter: drop-shadow(colors.$button-shadow 0 0 .1rem)
</style>
