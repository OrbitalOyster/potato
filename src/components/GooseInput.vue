<script setup lang="ts">
import { faEye, faEyeSlash, faTriangleExclamation } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GoosePopover from '#components/GoosePopover.vue'
import { ref } from 'vue'

type Validity = 'valid' | 'invalid'

defineProps<{
  autocomplete?: string
  autofocus?: boolean
  disabled?: boolean
  error?: string
  icon?: object
  name?: string
  password?: boolean
  placeholder?: string
  validity?: Validity
}>()

const model = defineModel<string>({ default: '' }),
  passwordHidden = ref(true)
</script>

<template>
  <div class="wrapper">
    <input
      v-model="model"
      :autocomplete
      :autofocus
      :class="['focusable', 'form-input', validity]"
      :disabled
      :name
      :placeholder
      :type="password && passwordHidden ? 'password' : 'text'"
    >
    <label v-if="placeholder">
      {{ placeholder }}
    </label>
    <div class="icons">
      <!-- Validation error icon -->
      <GoosePopover
        has-arrow
        hover-toggle
      >
        <div
          v-if="validity === 'invalid'"
          class="alert-icon"
        >
          <FontAwesomeIcon
            :icon="faTriangleExclamation"
            size="xl"
          />
        </div>
        <template #popover>
          <p class="validation-message">
            {{ error }}
          </p>
        </template>
      </GoosePopover>
      <!-- Custom icon -->
      <FontAwesomeIcon
        v-if="icon"
        :icon="icon"
        size="lg"
      />
      <!-- Password show/hide icon -->
      <FontAwesomeIcon
        v-if="password"
        :icon="passwordHidden ? faEye : faEyeSlash"
        size="xl"
        class="eye"
        @click="passwordHidden = !passwordHidden"
      />
    </div>
  </div>
</template>

<style lang="sass" scoped>
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
    display: flex
    position: absolute
    right: .5rem

  .validation-message
    padding: .5rem
    margin: .5rem

  .eye
    cursor: pointer
    height: 1.5rem
    width: 2rem
</style>
