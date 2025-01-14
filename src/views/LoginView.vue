<script setup lang="ts">
import GooseButton from '#components/GooseButton.vue'
import GooseForm from '#components/GooseForm.vue'
import GooseFormCheckbox from '#components/GooseFormCheckbox.vue'
import GooseFormInput from '#components/GooseFormInput.vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faCopyright } from '@fortawesome/free-regular-svg-icons'
import { faRightToBracket } from '@fortawesome/free-solid-svg-icons'
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '#stores/useUserStore.ts'

interface ILoginFormCheck {
  username: string
  password: string
  rememberMe: boolean
}

const router = useRouter(),
  userStore = useUserStore(),
  disabled = ref(false)

async function auth(formCheck: ILoginFormCheck | null) {
  if (!formCheck)
    return
  disabled.value = true
  if (await userStore.auth(formCheck.username, formCheck.password, formCheck.rememberMe))
    await router.push('/')
  else
    console.log('failed')
  disabled.value = false
}
</script>

<template>
  <div class="fs">
    <div class="wrapper">
      <GooseForm
        id="loginForm"
        @submit="auth"
      >
        <main class="card">
          <header>
            <div class="title">
              <h1>Gooseberry.js</h1>
              <h2>Последний шанс снять бахилы</h2>
            </div>
            <img src="/goose.png">
          </header>
          <GooseFormInput
            :checks="['required']"
            :disabled
            autocomplete="username"
            autofocus
            form-id="loginForm"
            name="username"
            placeholder="Имя пользователя"
          />
          <GooseFormInput
            :checks="['required']"
            :disabled
            autocomplete="password"
            form-id="loginForm"
            name="password"
            password
            placeholder="Пароль"
          />
          <footer>
            <GooseFormCheckbox
              :disabled
              form-id="loginForm"
              name="rememberMe"
              title="Запомнить меня"
            />
            <GooseButton
              :disabled
              :loading="disabled"
              :icon="faRightToBracket"
              submit
              title="Войти"
            />
          </footer>
        </main>
      </GooseForm>
      <div class="copyright">
        <span>
          <FontAwesomeIcon :icon="faCopyright" />
          {{ new Date().getFullYear() }}
        </span>
      </div>
    </div>
  </div>
</template>

<style scoped lang="sass">
  main
    display: flex
    flex-direction: column
    gap: 1rem
    height: fit-content
    min-width: 32rem
    padding: 1rem
    width: fit-content

  header
    align-items: center
    display: flex
    gap: 1rem
    justify-content: space-between

  .title
    display: flex
    flex-direction: column
    gap: .5rem

  h1
    font-size: 2rem
    font-weight: 500
    margin: .0rem

  h2
    font-size: 1rem
    font-weight: 500
    margin: .0rem

  img
    border-radius: 100%
    height: 4rem
    width: 4rem

  .inputs
    display: flex
    flex-direction: column
    gap: 1rem

  footer
    align-items: center
    display: flex
    justify-content: space-between

  .copyright
    display: flex
    justify-content: end
    padding: .75rem
</style>
