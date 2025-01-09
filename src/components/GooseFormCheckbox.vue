<script setup lang="ts">
import type { FormCheck } from '#stores/useFormStore.ts'
import { useFormStore } from '#stores/useFormStore.ts'

import GooseCheckbox from '#components/GooseCheckbox.vue'

const props = defineProps<{
    checks?: FormCheck[]
    disabled?: boolean
    formId: string
    name: string
    title?: string
    checked?: boolean
  }>(),
  store = useFormStore(props.formId)

store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = props.checked || false
</script>

<template>
  <GooseCheckbox 
    :disabled
    :name
    :title
    v-model="store.inputs[props.name]"
  />
</template>
