<script setup lang="ts">
import 'splitpanes/dist/splitpanes.css'
import { Pane, Splitpanes } from 'splitpanes'
import { faBuilding, faClipboard, faClipboardList, faFileExcel, faPencil, faRightFromBracket } from '@fortawesome/free-solid-svg-icons'
import GooseAccordion from '#components/GooseAccordion.vue'
import GooseButton from '#components/GooseButton.vue'
import GooseConfirm from '#components/GooseConfirm.vue'
import GooseTabs from '#components/GooseTabs.vue'
import { ref, useTemplateRef } from 'vue'
import { useUserStore } from '#stores/useUserStore.ts'
import { useRouter, RouterLink } from 'vue-router'

const userStore = useUserStore(),
  router = useRouter()

const accordionModel = ref([
  { id: 'orgs', title: 'Организации', icon: faBuilding },
  { id: 'forms', title: 'Формы', icon: faClipboard },
  { id: 'statuses', title: 'Статусы', icon: faPencil },
])

const slots = [
  { id: 'xlsx', title: 'Исходники', icon: faFileExcel },
  { id: 'initial', title: 'Первичные отчёты', icon: faClipboard },
  { id: 'complex', title: 'Сводные отчёты', icon: faClipboardList },
]

const logoutConfirm = useTemplateRef('logoutConfirm')

async function logout() {
  await userStore.logout()
  await router.push('/login')
}
</script>

<template>

  <GooseConfirm
    ref="logoutConfirm"
    title="Выйти из системы?"
    @submit="logout"
  />

  <div class="fs">
    <header>
      <div class="logo">
        <img src="/goose.png">
        <h1 class="logo">
          <RouterLink to="/">
            Gooseberry.js
          </RouterLink>
        </h1>
      </div>
      <div style="font-size: 1.5rem">Главная</div>
      <div style="align-items: center; display: flex; gap: 1rem">
        <div>
          Вы зашли как: 
          <strong>{{userStore.username}}</strong>
        </div>
        <GooseButton title="Выйти" :icon="faRightFromBracket" warning @click="logoutConfirm.show()"/>
      </div>
    </header>
    <Splitpanes vertical>
      <Pane
        max-size="50"
        size="25"
      >
        <aside>
          <GooseAccordion v-model="accordionModel">
            <template #Организации>
              <p>LoremIpsum</p>
            </template>
            <template #Формы>
              <p>Bar</p>
            </template>
          </GooseAccordion>
        </aside>
      </Pane>
      <Pane>
        <main>
          <GooseTabs :slots>
            <template #xlsx>
            <RouterLink to="/test">
              Form
            </RouterLink>
            </template>
            <template #initial>
              <p>Bar</p>
            </template>
            <template #complex>
              <p>Baz</p>
            </template>
          </GooseTabs>
        </main>
      </Pane>
    </Splitpanes>
  </div>
</template>

<style lang="sass" scoped>
a
  color: inherit

header
  display: flex
  align-items: center
  justify-content: space-between
  padding-left: .5rem
  padding-right: .5rem

.logo
  display: flex
  align-items: center
  gap: 1rem

h1.logo
  font-weight: 400

img
  border-radius: 100%
  height: 4rem
  width: 4rem

h1
  display: inline

aside
  background-color: transparent
  height: 100%
  padding-right: 0

main
  height: 100%
  padding-left: 0
  display: flex
  flex-direction: column

.splitpanes
  box-sizing: border-box
  padding: .5rem
  padding-top: 0

:deep(.splitpanes__splitter)
  min-width: 8px

:deep(.splitpanes__pane)
  min-width: 16rem

</style>
