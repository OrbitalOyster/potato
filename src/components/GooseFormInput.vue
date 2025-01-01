<script setup lang="ts">
import GooseInput from '#components/GooseInput.vue'
import type { FormCheck } from '#stores/useFormStore.ts'
import { useFormStore } from '#stores/useFormStore.ts'

const props = defineProps<{
    autocomplete?: string
    autofocus?: boolean
    checks?: FormCheck[]
    disabled?: boolean
    name: string
    password?: boolean
    placeholder?: string
    formId: string
    value?: string
  }>(),
  store = useFormStore(props.formId)

store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = props.value ?? ''
</script>

<template>
  <GooseInput
    v-model="store.inputs[props.name] as string"
    :autocomplete
    :autofocus
    :disabled
    :name
    :password
    :placeholder
    :validation="store.errors[props.name] ? 'invalid' : 'valid'"
    @input="store.validate"
  />
</template>
