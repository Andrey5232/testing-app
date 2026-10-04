// Обработка ошибок при работе с BaaS API
export class BaasApiError extends Error {
  constructor(message, status) {
    super(message);
    this.status = status;
    this.name = "BaasApiError";
  }
}

export function handleApiError(error) {
  if (error instanceof BaasApiError) {
    console.error(`API error [${error.status}]: ${error.message}`);
  } else {
    console.error("Unexpected error:", error);
  }
}