<script setup lang="ts">
import { ref, toRef } from 'vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import type { Leaf } from '#components/GooseTree.vue'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'

const props = defineProps<{
  tree: Leaf[]
  searchable?: boolean
}>()

const tree = toRef(props.tree)
const searchString = ref('')
</script>

<template>
  <GooseInput
    v-if="searchable"
    v-model="searchString"
  >
    <template #extra-icon>
      <FontAwesomeIcon
        :icon="faMagnifyingGlass"
        size="lg"
      />
    </template>
  </GooseInput>
  <GooseTree
    :tree
    :search-string
  />
</template>
