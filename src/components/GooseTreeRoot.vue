<script setup lang="ts">
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import type { Leaf } from '#components/GooseTree.vue'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import { ref, onBeforeMount } from 'vue'

const props = defineProps<{
  tree: Leaf[]
  searchable?: boolean
}>()

const searchString = ref('')
const checked = ref(false)

const masterModel = ref({})

function parseMasterModel(tree, master) {
  for (const [key, value] of Object.entries(tree)) {
    if (!tree[key].sub?.length)
      master[tree[key].id] = { title: tree[key].title, leaf: true, checked: false, toggled: false }
    else {
      master[tree[key].id] = { title: tree[key].title, leaf: false, checked: false, toggled: false, sub: {} }
      parseMasterModel(tree[key].sub, master[tree[key].id].sub)
    }
  }
}

parseMasterModel(props.tree, masterModel.value)

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
    v-model="masterModel"
  />
  <!--
  <p>{{ leafChecks }}</p>
  <p>{{ branchChecks }}</p>
  -->
  <p>{{ masterModel }}</p>
  <pre>{{ JSON.stringify(masterModel, 0, 1) }}</pre>
</template>

<style lang="sass" scoped>
</style>
