# Planning Decisions

## Management Group Structure

```mermaid
graph TD
    A[Tenant Root Group] --> B[Platform]
    B --> C[Management]
    B --> D[Identity]
    B --> E[Connectivity]
    A --> F[Landing Zones]
    F --> G[Production]
    F --> H[Non-Production]
    
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style G fill:#bbf,stroke:#333,stroke-width:2px
    style H fill:#bbf,stroke:#333,stroke-width:2px
```

## Network Architecture

```mermaid
graph LR
    A[On-premises] --- B[Hub vNet]
    B --- C[Prod Spoke]
    B --- D[Dev Spoke]
    B --- E[Shared Services]
    
    style B fill:#f9f,stroke:#333,stroke-width:2px
```

## Key Decisions
### 1. Networking Approach
- Hub and Spoke topology
- Azure Virtual WAN consideration
- DNS configuration
- Network security groups

### 2. Security Controls
- Policy assignments
- RBAC model
- Monitoring requirements

### 3. Governance Strategy
- Naming conventions
- Tagging standards
- Cost management approach

[Implementation Guide →](./implementation/index.md) 