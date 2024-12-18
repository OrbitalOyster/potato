<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useFormStore } from '#stores/useFormStore.ts'

const emits = defineEmits(['submit']),
  props = defineProps<{
    id: string
  }>(),
  store = useFormStore(props.id),
  validated = ref('')

function onSubmit() {
  emits('submit', store.isValid() ? store.inputs : null)
  validated.value = 'validated'
}

onMounted(() => store.validate())
</script>

<template>
  <form
    novalidate
    :class="validated"
    @submit.prevent="onSubmit"
  >
    <slot />
  </form>
</template>
