<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GooseMarkable from '#components/GooseMarkable.vue'
import { defineEmits } from 'vue'
import { faChevronRight } from '@fortawesome/free-solid-svg-icons'

interface Leaf {
  title: string
  sub?: Leaf[]
  toggled?: boolean
  matched?: boolean
}

const props = defineProps<{
  tree: Leaf[]
  searchString?: string
}>()

const emit = defineEmits(['update'])

function onUpdate(ind: number, matched: boolean) {
  if (!props.tree[ind])
    throw new Error('Major screwup')

  props.tree[ind].matched = matched

  /* Toggle leaf on match */
  if (props.searchString && matched)
    props.tree[ind].toggled = true

  emit('update', props.tree.filter(l => l.matched).length)
}

</script>

<template>
  <ul>
    <li
      v-for="leaf, i in tree"
      :key="i"
    >
      <div :style="{ display: leaf.matched ? 'block' : 'none' }">
        <div class="title">
          <FontAwesomeIcon
            v-if="leaf.sub?.length"
            :class="{ chevron: true, toggled: leaf.toggled }"
            :icon="faChevronRight"
            size="sm"
            @click="leaf.toggled = !leaf.toggled"
          />
          <GooseMarkable
            :title="leaf.title"
            :needle="searchString || ''"
            @update="e => onUpdate(i, e)"
          />
        </div>

        <div :style="{ display: leaf.toggled ? 'block': 'none' }">
          <GooseTree
            v-if="leaf.sub?.length"
            :tree="leaf.sub"
            :search-string
            @update="e => onUpdate(i, e)"
          />
        </div>
      </div>
    </li>
  </ul>
</template>

<style lang="sass" scoped>
  @use '../assets/style'
  @use '../assets/transitions'

  ul
    position: relative
    margin: .0rem
    overflow-y: auto
    padding: .0rem

  li
    display: block
    padding: .0rem .75rem .0rem 1.75rem
    user-select: none

  .title
    align-items: center
    display: flex
    height: 2rem

  .chevron
    cursor: pointer
    height: 1rem
    left: .1rem
    padding: .0rem
    position: absolute
    transition: transform 100ms
    width: 1rem

  .toggled
    transform: rotate(90deg)
</style>
