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
  @use '../assets/transitions'

  .wrapper
    align-items: center
    display: flex
    position: relative

  input
    @extend .form-input
    @extend .focusable
    color: colors.$text
    height: 2rem
    padding: .25rem 1rem .25rem 1rem
    transition: transitions.$focusable, transitions.$colors
    width: 100%

  input:disabled
    color: colors.$disabled-primary

  input[placeholder]
    padding-top: 1.5rem

  input::placeholder
    opacity: 0

  /* Shrinkable label */
  label
    color: colors.$input-label
    left: 1rem
    pointer-events: none
    position: absolute
    transform-origin: left
    transition: transitions.$transform
    user-select: none

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
    cursor: pointer
    height: 1.5rem
    width: 2.5rem
</style>
