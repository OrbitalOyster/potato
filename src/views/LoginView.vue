<script setup lang="ts">
import GooseButton from '#components/GooseButton.vue'
import GooseCheckbox from '#components/GooseCheckbox.vue'
import GooseForm from '#components/GooseForm.vue'
import GooseFormInput from '#components/GooseFormInput.vue'
import { ref } from 'vue'
import { useUserStore } from '#stores/useUserStore.ts'
import { useRouter } from 'vue-router'

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
          name="username"
          form-id="loginForm"
          :checks="['required']"
          placeholder="Имя пользователя"
          :disabled
          autofocus
          autocomplete="username"
        />
        <GooseFormInput
          name="password"
          form-id="loginForm"
          :checks="['required']"
          placeholder="Пароль"
          :disabled
          password
          autocomplete="password"
        />
        <footer>
          <GooseCheckbox
            title="Запомнить меня"
            name="rememberMe"
            form-id="loginForm"
            :disabled
          />
          <GooseButton
            title="Войти"
            icon="fa-right-to-bracket"
            :loading="disabled"
            :disabled
            submit
          />
        </footer>
      </main>
    </GooseForm>
  </div>
</template>

<style scoped lang="sass">
  .fs
    align-items: center
    display: flex
    height: 100vh
    justify-content: center
    width: 100vw

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
</style>
