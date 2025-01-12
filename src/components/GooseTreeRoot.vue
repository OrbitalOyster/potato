<script setup lang="ts">
import { ref } from 'vue'
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import type { Leaf } from '#components/GooseTree.vue'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'

defineProps<{
  tree: Leaf[]
  searchable?: boolean
}>()

const searchString = ref('')
const checked = ref(false)

function checkAll() {
  checked.value = !checked.value
}
</script>

<template>
  <button
    type="button"
    @click="checkAll"
  >
    check
  </button>
  <GooseInput
    v-if="searchable"
    v-model="searchString"
    :icon="faMagnifyingGlass"
  />
  <GooseTree
    :tree
    :checked
    :search-string
  />
</template>
