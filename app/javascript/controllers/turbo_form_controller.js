import { Controller } from 'stimulus'
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  static targets = ['submitInput']

  initialize() {
    this.onSubmit = this.onSubmit.bind(this)
  }

  connect() {
    this.element.addEventListener('submit', this.onSubmit)
  }

  async onSubmit(event) {
    event.preventDefault()

    const formData = new FormData(this.element)

    const request = new FetchRequest(this.element.method, this.element.action, {
      body: formData,
      responseKind: 'turbo-stream',
    })

    await request.perform()

    this.submitInputTarget.disabled = false
  }
}