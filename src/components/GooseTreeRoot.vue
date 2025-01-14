<script setup lang="ts">
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import type { Leaf } from '#components/GooseTree.vue'
import { ref } from 'vue'
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
  <GooseInput
    v-if="searchable"
    v-model="searchString"
    :icon="faMagnifyingGlass"
    style="padding-bottom: 1rem"
  />
  <GooseTree
    :tree
    :checked
    :search-string
  />
</template>

<style lang="sass" scoped>
</style>
