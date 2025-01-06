<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faChevronRight, faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import { defineEmits, ref, watch } from 'vue'
import GooseInput from '#components/GooseInput.vue'
import GooseMarkable from '#components/GooseMarkable.vue'

interface Leaf {
  title: string
  sub?: Leaf[]
  active?: boolean
  matched?: boolean
}

const props = defineProps<{
  tree: Leaf[]
  searchString?: string
}>()

const emit = defineEmits(['update']); 

function onUpdate(ind: number, matched: boolean) {
  props.tree[ind].matched = matched
  emit('update', props.tree.filter(l => l.matched).length)
}

</script>

<template>
  <div class="wrapper-tree">
    <ul>
      <li
        v-for="leaf, i in tree"
        :key="i"
      >

        <div :style="{
          display: leaf.matched ? 'block' : 'none'
        }">

        <div class="title">
          <FontAwesomeIcon
            v-if="leaf.sub?.length"
            class="chevron"
            :class="leaf.active && 'active'"
            :icon="faChevronRight"
            size="sm"
            @click="leaf.active = !leaf.active"
          />
          <GooseMarkable 
            :title="leaf.title"
            :needle="searchString"
            @update="e => onUpdate(i, e)"
          />
        </div>
        <Transition name="fade">
          <div
            v-if="leaf.active || searchString !== ''"
          >
            <GooseTree
              v-if="leaf.sub?.length"
              :tree="leaf.sub"
              :searchString="searchString"
              @update="e => onUpdate(i, e)"
            />
          </div>
        </Transition>

        </div>

      </li>
    </ul>
  </div>
</template>

<style lang="sass" scoped>
  @use '../assets/style'
  @use '../assets/transitions'

  /*
     TODO: Renaming it to "wrapper" cocks up styling, why?
   */
  .wrapper-tree
    position: relative

  ul
    margin: .0rem
    overflow-y: auto
    padding: .0rem

  li
    display: block
    padding: .0rem .75rem .0rem 1.75rem
    user-select: none

  .title
    display: flex
    align-items: center
    height: 1.5rem

  .chevron
    cursor: pointer
    position: absolute
    left: .1rem
    width: 1rem
    height: 1rem
    padding: .0rem
    transition: transform 100ms

  .active
    transform: rotate(90deg)
</style>
