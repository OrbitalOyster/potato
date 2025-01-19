<script setup lang="ts">
import { watch } from 'vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GooseCheckbox from '#components/GooseCheckbox.vue'
import GooseMarkable from '#components/GooseMarkable.vue'
import { faChevronRight } from '@fortawesome/free-solid-svg-icons'

export interface Leaf {
  title: string
  checked: boolean
  toggled?: boolean
  match?: boolean
  sub?: Leaf[]
}

const props = defineProps<{
    checked: boolean | null
    searchString?: string
  }>(),
  emit = defineEmits(['match', 'check'])

const model = defineModel<Leaf[]>()

if (!model.value)
  throw new Error('Major screwup')

/* Emit up */
watch(() => model.value!.map(l => l.checked), (after) => {
  /* TODO: Clunky */
  if (!after)
    throw new Error('Major screwup')

  /* Everything checked */
  if (after.every(e => e === true))
    emit('check', true)
  /* Nothing checked */
  else if (after.every(e => e === false))
    emit('check', false)
  /* So-so */
  else
    emit('check', null)
})

function onMatch(i: number, value: boolean) {
  /* TODO: Clunky */
  if (!model.value?.[i])
    throw new Error('Major screwup')

  model.value[i].match = value
  /* Toggle leaf on match */
  if (props.searchString && value)
    model.value[i].toggled = true

  emit('match', !!Object.values(model.value).filter(l => l.match).length)
}

function onCheck(leaf: Leaf, value: boolean) {
  leaf.checked = value
}

watch(() => props.checked, (value: boolean | null) => {
  /* TODO: Clunky */
  if (!model.value)
    throw new Error('Major screwup')

  if (value !== null)
    model.value.forEach(e => e.checked = value)
})

</script>

<template>
  <ul>
    <li
      v-for="(leaf, i) in model"
      :key="i"
    >
      <div :style="{ display: leaf.match ? 'block' : 'none' }">
        <div class="title">
          <FontAwesomeIcon
            v-if="leaf.sub"
            :class="{ chevron: true, toggled: leaf.toggled }"
            :icon="faChevronRight"
            size="sm"
            @click="leaf.toggled = !leaf.toggled"
          />

          <!-- Branch -->
          <GooseCheckbox
            v-if="leaf.sub"
            v-model="leaf.checked"
            name="branch"
            @update="value => onCheck(leaf, value)"
          />

          <!-- Leaf -->
          <GooseCheckbox
            v-if="!leaf.sub"
            v-model="leaf.checked"
            name="leaf.id"
            @update="value => onCheck(leaf, value)"
          />

          <GooseMarkable
            :needle="searchString || ''"
            :title="leaf.title"
            @update="value => onMatch(i, value)"
          />
        </div>
        <div :style="{ display: leaf.toggled ? 'block': 'none' }">
          <GooseTree
            v-if="leaf.sub"
            v-model="leaf.sub"
            :search-string
            :checked="leaf.checked"
            @match="e => onMatch(i, e)"
            @check="value => onCheck(leaf, value)"
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
    height: 3rem

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
