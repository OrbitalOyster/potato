<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faChevronRight, faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import { ref, toRef } from 'vue'
import GooseInput from '#components/GooseInput.vue'

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
    <GooseInput v-if="searchable" v-model="searchString">
      <template #extra-icon>
        <FontAwesomeIcon
          :icon="faMagnifyingGlass"
          size="sm"
        />
      </template>
    </GooseInput>
    <ul>
      <li
        v-for="leaf, i in tree"
        :key="i"
      >
        <div class="title">
          <FontAwesomeIcon
            v-if="leaf.sub?.length"
            class="chevron"
            :class="leaf.active && 'active'"
            :icon="faChevronRight"
            size="sm"
            @click="leaf.active = !leaf.active"
          />
          {{ leaf.title }}
        </div>
        <Transition name="fade">
          <div
            v-if="leaf.active"
          >
            <GooseTree
              v-if="leaf.sub?.length"
              :tree="leaf.sub"
            />
          </div>
        </Transition>
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
    display: flex
    flex-direction: column
    position: relative
    gap: .5rem

  ul
    margin: .0rem
    overflow-y: auto
    padding: .0rem

  li
    display: block
    padding: .5rem .75rem .0rem 1.75rem
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
