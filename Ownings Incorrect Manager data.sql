

select  * from 
			(select  a.FirstName + ' ' + a.LastName as EmployeeName
					,a.JobTitle
					,a.ManagerName
					,a.ManagerJobTitle
					,a.EmploymentStatus
			from (
							SELECT e.[EDPEmployeeKey]
								  ,e.[FirstName]
								  ,e.[LastName]
								  ,e.[PreferredName]
								  ,e.[ManagerEDPEmployeeKey]
								  ,e2.FirstName + ' ' + e2.LastName AS ManagerName
								  ,e2.JobFunction as ManagerJobTitle
								  ,d.BK_DivisionName as DivisionName
								  ,e.[JobFunction] as JobTitle
								  ,e.[BusinessTitle]
								  ,e.[WorkEmail]
								  ,e.[CostCenter]
								  ,e.[JobCode]
								  ,e.[WorkLocationKey]
								  ,e.[EDPDivisionKey]
								  ,e.[CeridianId]
								  ,e.[EncompassLogin]
								  ,e.[SpotId]
								  ,e.[EmploymentType]
								  ,e.[EmploymentStatus]
							  FROM [EDW].[edp].[Employee] e
							  left join [edp].[Employee] e2 on e.ManagerEDPEmployeeKey = e2.EDPEmployeeKey
							  left join  [edp].[Division] d on d.EDPDivisionKey = e.EDPDivisionKey
							  where d.BK_DivisionName like '%Owning%'		-----change to filter through division/subsidiary 
							  and e.JobFunction like '%Underwrit%'			---- change to filter through job title
							)a	
			where a.JobTitle not in ('VP Credit and Underwriting','Regional Underwriting Manager') and a.EmploymentStatus != 'terminated' and a.ManagerJobTitle != 'Regional Underwriting Manager'
			)b




