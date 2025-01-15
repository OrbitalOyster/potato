<script setup lang="ts">
import type { FormCheck } from '#stores/useFormStore.ts'
import GooseCheckbox from '#components/GooseCheckbox.vue'
import { useFormStore } from '#stores/useFormStore.ts'

const props = defineProps<{
    checks?: FormCheck[]
    disabled?: boolean
    formId: string
    name: string
    title?: string
  }>(),
  store = useFormStore(props.formId)

store.checks[props.name] = props.checks ?? []
store.inputs[props.name] = false
</script>

<template>
  <GooseCheckbox
    v-model="store.inputs[props.name]"
    :disabled
    :name
    :title
  />
</template>
