<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import type { IconDefinition } from '@fortawesome/fontawesome-common-types'
import { faAngleDown } from '@fortawesome/free-solid-svg-icons'
import { ref } from 'vue'

defineProps<{
  slots: {
    title: string
    icon: IconDefinition
  }[]
}>()
const selected = ref('')
</script>

<template>
  <ul>
    <li
      v-for="slot in slots"
      :key="slot.title"
      class="carddd"
      :style="{ 'flex-grow': slot.title === selected ? 1 : 0 }"
    >
      <div
        class="title"
        @click="selected = selected === slot.title ? '' : slot.title"
      >
        <div style="display: flex; align-items: center">
          <div class="icon">
            <FontAwesomeIcon
              :icon="slot.icon"
              size="xl"
            />
          </div>
          <h1>
            {{ slot.title }}
          </h1>
        </div>
        <div
          :style="{ transform: selected === slot.title ? 'rotate(180deg)' : 'none'}"
        >
          <FontAwesomeIcon
            :icon="faAngleDown"
            size="xl"
          />
        </div>
      </div>
      <div
        v-if="slot.title === selected"
        class="slot-container"
      >
        <slot :name="slot.title" />
      </div>
    </li>
  </ul>
</template>

<style lang="sass" scoped>
  ul
    padding: 0
    margin: 0
    display: flex
    flex-direction: column
    height: 100%

  li
    overflow: hidden
    transition: 100ms flex-grow ease-in-out

  .title
    display: flex
    justify-content: space-between
    align-items: center
    cursor: pointer
    user-select: none
    height: 3.5rem

  .icon
    display: inline-flex
    width: 3rem
    justify-content: center

  h1
    padding: 0
    margin: 0
    font-weight: normal
    font-size: 1rem

  .slot-container
    /* Substract toggler height */
    height: calc(100% - 3rem)
    overflow: auto
    height: 100%
</style>
