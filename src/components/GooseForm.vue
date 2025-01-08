<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useFormStore } from '#stores/useFormStore.ts'

const props = defineProps<{
    id: string
  }>(),
  emits = defineEmits(['submit']),
  store = useFormStore(props.id),
  validated = ref(false)

onMounted(() => store.validate())
</script>

<template>
  <form
    novalidate
    :class="{ validated }"
    @submit.prevent="emits('submit', store.isValid() ? store.inputs : null); validated = true"
  >
    <slot />
  </form>
</template>
