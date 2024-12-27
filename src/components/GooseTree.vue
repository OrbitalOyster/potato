<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faChevronRight } from '@fortawesome/free-solid-svg-icons'
import { useTemplateRef, ref, toRef } from 'vue'

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
        v-for="(leaf, i) in tree"
        :key="i"
      >
        <div class="title">
          <FontAwesomeIcon
            class="chevron"
            :class="leaf.active && 'active'"
            :icon="faChevronRight"
            size="sm"
            v-if="leaf.sub?.length"
            @click="leaf.active = !leaf.active; console.log(leaf)"
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
    margin-top: .5rem
    overflow-y: auto
    padding: 0

  li
    display: block
    padding: .5rem .75rem .2rem 1.75rem
    user-select: none

  .title
    display: flex
    align-items: center

  .chevron
    cursor: pointer
    position: absolute
    left: .1rem 
    border: 1px solid transparent
    border-radius: 1rem
    width: 1rem
    height: 1rem
    padding: .1rem
    transition: transform 100ms

  .chevron:hover
    background-color: #EAECEE

  .active
    transform: rotate(90deg)

  .hidden
    display: none

</style>
