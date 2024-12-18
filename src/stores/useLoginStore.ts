import type { AxiosResponse } from 'axios'
import axios from 'axios'
import { defineStore } from 'pinia'

interface ILoginStore {
  username: null | string
  role: null | string
}

interface IAuthResponse {
  username: string
  role: string
}

const authEndpoint = import.meta.env.VITE_AUTH_API,
  axiosOptions = { withCredentials: true }

if (!authEndpoint)
  throw new Error('Missing auth endpoint')

const useLoginStore = defineStore('login', {
  state: (): ILoginStore => ({
    username: null,
    role: null,
  }),
  actions: {
    /* Checks if user's logged in */
    async check() {
      /* Already logged in */
      if (this.username)
        return true
      const res: AxiosResponse<IAuthResponse | null>
        = await axios.get(`${authEndpoint}/check`, axiosOptions)
      /* Invalid token */
      if (res.data === null)
        return false
      this.username = res.data.username
      this.role = res.data.role
      return true
    },
    /* Logs user in */
    async auth(username: string, password: string, rememberMe: boolean) {
      const res: AxiosResponse<IAuthResponse | null> = await axios.post(
        `${authEndpoint}/auth`, {
          username,
          password,
          rememberMe,
        }, axiosOptions,
      )
      /* Failed login */
      if (res.data === null)
        return false
      this.username = res.data.username
      this.role = res.data.role
      return true
    },
    async logout() {
      await axios.get(`${authEndpoint}/logout`, axiosOptions)
      this.username = null
      this.role = null
    },
  },
})

export { useLoginStore }
