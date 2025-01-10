<script setup lang="ts">
import { defineEmits, ref } from 'vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GooseCheckbox from '#components/GooseCheckbox.vue'
import GooseMarkable from '#components/GooseMarkable.vue'
import { faChevronRight } from '@fortawesome/free-solid-svg-icons'

export interface Leaf {
  title: string
  sub?: Leaf[]
  toggled?: boolean
}

const props = defineProps<{
    tree: Leaf[]
    searchString?: string
  }>(),
  emit = defineEmits(['match', 'check'])

const l = props.tree.length
const toggles = ref(Array(l).fill(false)),
  matches = ref(Array(l).fill(true)),
  checks = ref(Array(l).fill(false))

function onMatch(i: number, value: boolean) {
  /* stfu, eslint */
  if (!props.tree[i])
    throw new Error('Major screwup')
  matches.value[i] = value
  /* Toggle leaf on match */
  if (props.searchString && value)
    toggles.value[i] = true
  emit('match', matches.value.filter(l => l).length)
}

function onCheck(i: number, value: boolean) {
  checks.value[i] = value

  /* Everything checked */
  if (checks.value.every(c => c === true))
    emit('check', true)
  /* Nothing checked */
  else if (checks.value.every(c => c === false))
    emit('check', false)
  /* So-so */
  else
    emit('check', null)
}
</script>

<template>
  <ul>
    <li
      v-for="leaf, i in tree"
      :key="i"
    >
      <div :style="{ display: matches[i] ? 'block' : 'none' }">
        <div class="title">
          <FontAwesomeIcon
            v-if="leaf.sub?.length"
            :class="{ chevron: true, toggled: toggles[i] }"
            :icon="faChevronRight"
            size="sm"
            @click="toggles[i] = !toggles[i]"
          />
          <GooseCheckbox
            v-model="checks[i]"
            name="bogus"
            @update="e => onCheck(i, e)"
          />
          <GooseMarkable
            :needle="searchString || ''"
            :title="leaf.title"
            @update="e => onMatch(i, e)"
          />
        </div>

        <div :style="{ display: toggles[i] ? 'block': 'none' }">
          <GooseTree
            v-if="leaf.sub?.length"
            :search-string
            :tree="leaf.sub"
            @match="e => onMatch(i, e)"
            @check="e => onCheck(i, e)"
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
    padding: .0rem .0rem .0rem 1.75rem
    user-select: none

  .title
    align-items: center
    display: flex
    gap: .5rem
    height: 2.5rem

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
