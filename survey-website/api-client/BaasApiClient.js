// Адаптер сайта-опросника к BaaS-платформе.
// Все запросы к чужой системе идут через этот модуль.

const BASE_URL = "http://localhost:5000/api";

export async function login(email, password) {
  const response = await fetch(`${BASE_URL}/auth/login`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ email, password })
  });
  if (!response.ok) throw new Error("Login failed");
  return response.json();
}

export async function register(email, password) {
  const response = await fetch(`${BASE_URL}/auth/register`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ email, password })
  });
  if (!response.ok) throw new Error("Register failed");
  return response.json();
}

export async function getProfile(userId, token) {
  const response = await fetch(`${BASE_URL}/profile/${userId}`, {
    method: "GET",
    headers: { "Authorization": `Bearer ${token}` }
  });
  if (!response.ok) throw new Error("Profile fetch failed");
  return response.json();
}