<script setup lang="ts">
import { faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import type { FormCheck } from '#stores/useFormStore.ts'
import { ref } from 'vue'
import { useFormStore } from '#stores/useFormStore.ts'

const props = defineProps<{
    autocomplete?: string
    autofocus?: boolean
    checks?: FormCheck[]
    disabled?: boolean
    name: string
    password?: boolean
    placeholder?: string
    storeId: string
    value?: string
  }>(),
  store = useFormStore(props.storeId),

  passwordHidden = ref(true)

store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = props.value ?? ''
</script>

<template>
  <div
    class="wrapper"
  >
    <input
      v-model="store.inputs[props.name]"
      :class="[
        store.errors[props.name] ? 'invalid' : 'valid',
      ]"
      :name
      :autofocus
      :placeholder
      :disabled
      :type="password && passwordHidden ? 'password' : 'text'"
      :autocomplete
      @input="store.validate"
    >
    <label>
      {{ placeholder }}
    </label>
    <div class="icons">
      <font-awesome-icon
        v-if="password"
        :icon="passwordHidden ? faEye : faEyeSlash"
        size="xl"
        class="eye"
        @click="passwordHidden = !passwordHidden"
      />
    </div>
  </div>
</template>

<style scoped lang="sass">
  @use '../assets/colors'
  @use '../assets/style'

  .wrapper
    display: flex
    align-items: center
    position: relative

  input
    @extend .form-input
    @extend .focusable
    width: 100%
    height: 2rem
    color: colors.$text
    padding: .25rem
    padding-left: 1rem
    transition: style.$focusable-transition

  input:disabled
    color: colors.$disabled-primary

  input[placeholder]
    padding-top: 1.5rem

  input::placeholder
    opacity: 0

  /* Shrinkable label */
  label
    position: absolute
    left: 1rem
    color: colors.$input-label
    user-select: none
    pointer-events: none
    transition: transform 100ms ease-in-out
    transform-origin: left

  /* Shrink and translate label if:
   * - input is focused
   * - placeholder not shown
   * - input is not empty */
  input[placeholder]:focus + label,
  input[placeholder]:not(:placeholder-shown) + label,
  input:not(:empty) + label
    transform: translateY(calc(-70%)) scale(.9)

  .icons
    position: absolute
    right: .5rem

  .eye
    width: 2.5rem
    height: 1.5rem
    cursor: pointer
</style>
