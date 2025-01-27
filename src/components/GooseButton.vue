<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import type { IconDefinition } from '@fortawesome/fontawesome-common-types'
import { faSpinner } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
    icon?: IconDefinition
    loading?: boolean
    submit?: boolean
    title?: string
    warning?: boolean
  }>(),
  type = props.submit ? 'submit' : 'button'
</script>

<template>
  <button
    :type
      :class="{ focusable: true, primary: true, warning }"
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

  .primary
    background-color: colors.$primary

  .primary:active:enabled
    background-color: colors.$active

  .warning
    background-color: colors.$warning

  .warning:active:enabled
    background-color: colors.$warning-active

  button
    align-items: center
    border-radius: borders.$radius
    border: none
    color: colors.$button
    cursor: pointer
    display: inline-flex
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
    filter: drop-shadow(colors.$button-shadow 0 .16rem .1rem)
    transform: translateY(0)

  button:disabled
    background-color: colors.$disabled-primary
    color: colors.$disabled
</style>
