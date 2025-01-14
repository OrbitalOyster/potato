<script setup lang="ts">
import { nextTick, ref, useTemplateRef } from 'vue'
import GooseButton from '#components/GooseButton.vue'
import { useFocusTrap } from '@vueuse/integrations/useFocusTrap'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faTriangleExclamation, faCheck, faMultiply } from '@fortawesome/free-solid-svg-icons'

defineProps<{
  title: string
}>()
const emit = defineEmits(['submit']),
  active = ref(false),
  dialog = useTemplateRef('dialog'),
  onEsc = () => {
    active.value = false
    return true
  },
  { activate, deactivate } = useFocusTrap(dialog, { escapeDeactivates: onEsc }),
  show = async () => {
    active.value = true
    await nextTick()
    activate()
  },
  hide = () => {
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
            <p class="p-4">
              {{ title }}
            </p>
          </div>
          <footer class="flex justify-end pt-4 space-x-2 border-t">
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
  .dialog
    padding: 1rem

  .message
    display: flex
    flex-direction: row
    align-items: center
    padding-bottom: 1rem
</style>
