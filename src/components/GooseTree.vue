<script setup lang="ts">
import { ref, watch } from 'vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import GooseCheckbox from '#components/GooseCheckbox.vue'
import GooseMarkable from '#components/GooseMarkable.vue'
import { faChevronRight } from '@fortawesome/free-solid-svg-icons'

export interface Leaf {
  title: string,
  leaf: boolean,
  checked: boolean,
  toggled: boolean
  match: boolean,
  sub?: Record<string, Leaf>
}

const props = defineProps<{
    checked: boolean | null
    searchString?: string
  }>(),
  emit = defineEmits(['match', 'check'])

const model = defineModel<Record<string, Leaf>>()

if (!model.value)
  throw new Error('Major screwup')

/* Emit up */
watch(() => Object.values(model.value).map(l => l.checked), (after) => {
  /* Everything checked */
  if (after.every(e => e === true))
    emit('check', true)
  /* Nothing checked */
  else if (after.every(e => e === false))
    emit('check', false)
  /* So-so */
  else
    emit('check', null)
});

function onMatch(key: string, value: boolean) {
  /* stfu, eslint */
  // if (!props.tree[i])
  //  throw new Error('Major screwup')
  model.value[key].match = value
  /* Toggle leaf on match */
  if (props.searchString && value)
    model.value[key].toggled = true

  emit('match', !!Object.values(model.value).filter(l => l.match).length)
}

function onCheck(leaf: Leaf, value: boolean) {
  leaf.checked = value
}

watch(() => props.checked, (e) => {
  if (e !== null)
    for (const [key] of Object.entries(model.value))
      model.value[key].checked = e
})

</script>

<template>
  <ul>
    <li
      v-for="(leaf, key, i) in model"
      :key
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
            @update="e => onCheck(leaf, e)"
          />

          <!-- Leaf -->
          <GooseCheckbox
            v-if="!leaf.sub"
            v-model="leaf.checked"
            name="leaf.id"
            @update="e => onCheck(leaf, e)"
          />

          <GooseMarkable
            :needle="searchString || ''"
            :title="leaf.title"
            @update="e => onMatch(key, e)"
          />
        </div>
        <div :style="{ display: leaf.toggled ? 'block': 'none' }">
          <GooseTree
            v-if="leaf.sub"
            :search-string
            :checked="leaf.checked"
            @match="e => onMatch(key, e)"
            @check="e => onCheck(leaf, e)"
            v-model="leaf.sub"
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
