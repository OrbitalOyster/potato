<script setup lang="ts">
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import type { Leaf } from '#components/GooseTree.vue'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import { ref } from 'vue'

defineProps<{
  searchable?: boolean
}>()

const checked = ref(false),
  searchString = ref(''),
  model = defineModel<Leaf[]>()

</script>

<template>
  <GooseInput
    v-if="searchable"
    v-model="searchString"
    :icon="faMagnifyingGlass"
    style="padding-bottom: 1rem"
  />
  <GooseTree
    :checked="checked || false"
    :search-string
    v-model="model"
  />
  <pre>{{ model }}</pre>
</template>

<style lang="sass" scoped>
</style>
