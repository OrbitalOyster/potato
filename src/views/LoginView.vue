<script setup lang="ts">
import GooseButton from '#components/GooseButton.vue'
import GooseInput from '#components/GooseInput.vue'
import GooseForm from '#components/GooseForm.vue'
import { useLoginStore } from '#stores/useLoginStore.ts'
import { useRouter } from 'vue-router'
import { ref, useTemplateRef } from 'vue'

interface ILoginFormCheck {
  username: string
  password: string
  rememberMe: boolean
}

const router = useRouter(),
  loginStore = useLoginStore(),
  disabled = ref(false),

  auth = async (formCheck: ILoginFormCheck | null) => {
    if (!formCheck)
      return
    disabled.value = true
    if (await loginStore.auth(formCheck.username, formCheck.password, formCheck.rememberMe))
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
            <h2>Последний шанс снять бахиллы</h2>
          </div>
          <img src="/goose.png" />
        </header>

        <GooseInput
          name="username"
          store-id="loginForm"
          :checks="['required']"
          placeholder="Имя пользователя"
          :disabled
          autofocus
        />

        <GooseInput
          name="password"
          store-id="loginForm"
          :checks="['required']"
          placeholder="Пароль"
          :disabled
          password
        />

        <footer>
          <div>
            Запомнить меня
          </div>
          <GooseButton
            title="Войти"
            type="submit"
          />
        </footer>

      </main>
    </GooseForm>
  </div>
</template>

<style scoped lang="sass">
  .fs
    display: flex
    align-items: center
    justify-content: center
    width: 100vw
    height: 100vh

  main
    display: flex
    flex-direction: column
    gap: 1rem
    width: 600px
    height: fit-content
    padding: 1rem

  header
    display: flex
    align-items: center
    justify-content: space-between
    gap: 1rem

  .title
    display: flex
    flex-direction: column
    gap: .5rem

  h1
    margin: .0rem
    font-size: 2rem
    font-weight: 500

  h2
    margin: .0rem
    font-size: 1rem
    font-weight: 500

  img
    width: 4rem
    height: 4rem
    border-radius: 100%

  .inputs
    display: flex
    flex-direction: column
    gap: 1rem

  footer
    display: flex
    align-items: center
    justify-content: space-between

</style>
