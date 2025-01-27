<script setup lang="ts">
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import type { IconDefinition } from '@fortawesome/fontawesome-common-types'
import { ref } from 'vue'

interface TabSlot {
  id: string
  title: string
  icon: IconDefinition
}

const props = defineProps<{
    slots: TabSlot[]
  }>(),
  selected = ref(props.slots[0].id)
</script>

<template>
  <ul>
    <li
      v-for="slot in slots"
      :key="slot.id"
      class=""
      :class="{'selected': slot.id === selected}"
      @click="selected = slot.id"
    >
      <h1>
        <FontAwesomeIcon
          :icon="slot.icon"
          size="lg"
          style="width: 2rem"
        />
        <span>{{ slot.title }}</span>
      </h1>
    </li>
  </ul>
  <div class="card" style="height: 100%">
    <div
      v-for="slot in slots"
      :key="slot.id"
    >
      <div
        v-if="slot.id === selected"
      >
        <slot :name="slot.id" />
      </div>
    </div>
  </div>
</template>

<style lang="sass" scoped>
  @use '../assets/colors'
  @use '../assets/borders'

  ul
    padding: 0
    margin: 0
    display: flex
    flex-direction: row

  li
    background-color: white
    cursor: pointer
    color: colors.$text-inactive
    user-select: none
    white-space: nowrap
    position: relative
    display: flex
    padding: .5rem
    margin-top: .5rem
    border: borders.$card-inactive
    border-radius: borders.$radius
    border-bottom: none
    border-bottom-left-radius: 0
    border-bottom-right-radius: 0
    transition: margin 100ms ease-in-out, transform 100ms ease-in-out

  li.selected
    border: borders.$card
    border-bottom: none
    color: colors.$text
    margin-top: 0
    z-index: 99
    transform: translate(0, borders.$radius)

  h1
    padding: 0
    margin: 0
    font-weight: normal
    font-size: 1rem

</style>
