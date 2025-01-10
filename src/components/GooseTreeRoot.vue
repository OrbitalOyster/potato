<script setup lang="ts">
import { ref } from 'vue'
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import type { Leaf } from '#components/GooseTree.vue'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
  tree: Leaf[]
  searchable?: boolean
}>()

const searchString = ref('')
</script>

<template>
  <GooseInput
    v-if="searchable"
    v-model="searchString"
    :icon="faMagnifyingGlass"
  />
  <GooseTree
    :tree
    :search-string
  />
</template>
