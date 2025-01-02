<script setup lang="ts">
import { faEye, faEyeSlash, faTriangleExclamation } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { ref } from 'vue'

type Validation = 'valid' | 'invalid'

defineProps<{
  autocomplete?: string
  autofocus?: boolean
  disabled?: boolean
  name?: string
  password?: boolean
  placeholder?: string
  validation?: Validation
  error?: string
}>()

const passwordHidden = ref(true),
  model = defineModel({ type: String })
</script>

<template>
  <div
    class="wrapper"
  >
    <input
      v-model="model"
      :autocomplete
      :autofocus
      class="focusable form-input"
      :class="validation"
      :disabled
      :name
      :placeholder
      :type="password && passwordHidden ? 'password' : 'text'"
    >
    <label v-if="placeholder">
      {{ placeholder }}
    </label>
    <div class="icons">
      <div v-if="validation === 'invalid'" class="alert-icon">
        <font-awesome-icon
          :icon="faTriangleExclamation"
          size="xl"
          :title="error"
        />
      </div>
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
  @use '../assets/transitions'

  .wrapper
    align-items: center
    display: flex
    position: relative

  input
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

  form:not(.validated) .fa-triangle-exclamation
    color: red

  .eye
    cursor: pointer
    height: 1.5rem
    width: 2.5rem
</style>
