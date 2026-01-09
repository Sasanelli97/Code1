(async () => {
const API_KEY = "bb_YOUR_API_KEY";
const API_URL = "https://cloud.blackbox.ai/api/tasks";

const data = {
    prompt: "Create README in French",
    repoUrl: "https://github.com/<org-name>/<repo-name>.git",
    selectedBranch: "main",
    selectedAgent: "blackbox",
    selectedModel: "blackboxai/blackbox-pro"
};

const response = await fetch(API_URL, {
    method: "POST",
    headers: {
        Authorization: `Bearer ${API_KEY}`,
        "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
});

const responseData = await response.json();
console.log(responseData);
})();