export default {
    apiUrl:     typeof window.DEFAULT_SETTINGS !== 'undefined' ? window.DEFAULT_SETTINGS.apiUrl     : "/api",
    csrfToken:  typeof window.DEFAULT_SETTINGS !== 'undefined' ? window.DEFAULT_SETTINGS.csrfToken  : "",
    jwt:        typeof window.DEFAULT_SETTINGS !== 'undefined' ? window.DEFAULT_SETTINGS.jwt        : ""
}