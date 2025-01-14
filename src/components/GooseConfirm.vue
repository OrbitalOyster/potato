<script setup lang="ts">
import { nextTick, ref, useTemplateRef } from 'vue'
import GooseButton from '#components/GooseButton.vue'
import { useFocusTrap } from '@vueuse/integrations/useFocusTrap'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faCheck, faMultiply, faTriangleExclamation } from '@fortawesome/free-solid-svg-icons'

defineProps<{
  title: string
}>()

const emit = defineEmits(['submit']),
  active = ref(false),
  dialog = useTemplateRef('dialog')

function onEsc() {
  active.value = false
  return true
}

const { activate, deactivate } = useFocusTrap(dialog, { escapeDeactivates: onEsc })

async function show() {
  active.value = true
  await nextTick()
  activate()
}

function hide(params) {
  active.value = false
  deactivate()
}

defineExpose({ show })
</script>

<template>
  <Teleport to="#modals">
    <Transition name="fade">
      <div
        v-if="active"
        class="fs backdrop"
      >
        <div
          ref="dialog"
          class="card dialog"
        >
          <div class="message">
            <FontAwesomeIcon
              :icon="faTriangleExclamation"
              size="3x"
            />
            <p class="title">
              {{ title }}
            </p>
          </div>
          <footer>
            <GooseButton
              title="Ok"
              :icon="faCheck"
              @click="emit('submit'); hide()"
            />
            <GooseButton
              title="Отмена"
              :icon="faMultiply"
              @click="hide"
            />
          </footer>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<style lang="sass" scoped>
  @use '../assets/colors'
  @use '../assets/transitions'

  .dialog
    padding: 1rem

  .message
    align-items: center
    display: flex
    flex-direction: row
    gap: 1rem
    padding-bottom: 1.5rem

  .fa-triangle-exclamation
    color: colors.$warning

  p.title
    padding: .5rem

  footer
    display: flex
    justify-content: end
    gap: 1rem
</style>
