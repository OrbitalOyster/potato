<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faChevronRight } from '@fortawesome/free-solid-svg-icons'
import { toRef } from 'vue'

interface Leaf {
  title: string
  sub?: Leaf[]
  active?: boolean
}

const props = defineProps<{
  tree: Leaf[]
}>()

const tree = toRef(props.tree)
</script>

<template>
  <div class="wrapper">
    <ul>
      <li
        v-for="leaf in tree"
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

  .wrapper
    position: relative

  ul
    margin-top: .0rem
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
