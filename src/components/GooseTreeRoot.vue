<script setup lang="ts">
import { ref, toRef } from 'vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GooseInput from '#components/GooseInput.vue'
import GooseTree from '#components/GooseTree.vue'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'

interface Leaf {
  title: string
  sub?: Leaf[]
  active?: boolean
}

const props = defineProps<{
  tree: Leaf[]
  searchable?: boolean
}>()

const tree = toRef(props.tree)
const searchString = ref('')
</script>

<template>
  <div class="wrapper-tree">
    <GooseInput
      v-if="searchable"
      v-model="searchString"
    >
      <template #extra-icon>
        <FontAwesomeIcon
          :icon="faMagnifyingGlass"
          size="sm"
        />
      </template>
    </GooseInput>
    <GooseTree
      :tree
      :search-string
    />
  </div>
</template>
