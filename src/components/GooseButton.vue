<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faSpinner } from '@fortawesome/free-solid-svg-icons/faSpinner'

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
    type="button"
    @click="console.log('Ok')"
  >
    <div>
      {{ title }}
      <FontAwesomeIcon
        class="fa-pulse"
        :icon="faSpinner"
        size="lg"
      />
    </div>
  </button>
</template>

<style scoped lang="sass">
  @use '../assets/style'
  @use '../assets/colors'

  $transition-params: 50ms ease-in-out
  $transition-colors: background-color $transition-params

  button
    @extend .focusable
    padding: 1rem
    margin: 1rem
    border: none
    border-radius: .4rem
    font-size: 1.25rem
    color: white
    background-color: colors.$primary
    transform: translateY(0)
    transition: $transition-colors, style.$focusable-transition, filter $transition-params, transform $transition-params
    filter: drop-shadow(colors.$primary-shadow 0 .24rem .1rem)
    cursor: pointer
    user-select: none

  button:hover
    /* background-color: colors.$hover */
    transform: translateY(-.1rem)
    filter: drop-shadow(colors.$primary-shadow 0 .39rem .2rem)

  button:active
    background-color: colors.$active
    transform: translateY(0)
    filter: drop-shadow(colors.$primary-shadow 0 .24rem .1rem)

  button:disabled
    background-color: colors.$disabled

  div
    display: flex
    gap: .5rem
    filter: drop-shadow(colors.$primary-shadow 0 0 .1rem)
</style>
