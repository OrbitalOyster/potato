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

const masterModel = defineModel<Record<string, Leaf>>()

if (!masterModel.value)
  throw new Error('Major screwup')

/* Emit up */
watch(() => Object.values(masterModel.value).map(l => l.checked), (after) => {
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
  masterModel.value[key].match = value
  /* Toggle leaf on match */
  if (props.searchString && value)
    masterModel.value[key].toggled = true

  emit('match', !!Object.values(masterModel.value).filter(l => l.match).length)
}

function onLeafCheck(leaf: Leaf, value: boolean) {
  // console.log(key, value)

  //if (!masterModel.value)
  //  throw new Error('Major screwup')

  leaf.checked = value

}

watch(() => props.checked, (e) => {
  // console.log('watch fired')
  if (e !== null)
    for (const [key] of Object.entries(masterModel.value))
      masterModel.value[key].checked = e
})

// console.log(props.tree)
// console.log(masterModel.value)

</script>

<template>
  <ul>
    <li
      v-for="(leaf, key, i) in masterModel"
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

          <!--
          <GooseCheckbox
            v-if="leaf.sub"
            v-model="branchChecks[leaf.id]"
            name="branch"
            @update="e => onBranchCheck(i, e)"
          />
          -->

          <GooseCheckbox
            v-if="leaf.sub"
            v-model="leaf.checked"
            name="branch"
            @update="e => onLeafCheck(leaf, e)"
          />

          <!-- Leaf -->
          <!--
          <GooseCheckbox
            v-if="!leaf.sub"
            v-model="leafChecks[leaf.id]"
            name="leaf.id"
            @update="e => onLeafCheck(i, e)"
          />
          -->

          <GooseCheckbox
            v-if="!leaf.sub"
            v-model="leaf.checked"
            name="leaf.id"
            @update="e => onLeafCheck(leaf, e)"
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
            @check="e => onLeafCheck(leaf, e)"
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
