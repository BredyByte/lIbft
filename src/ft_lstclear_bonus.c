/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstclear_bonus.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dbredykh <dbredykh@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/28 19:22:04 by dbredykh          #+#    #+#             */
/*   Updated: 2023/06/19 15:59:46 by dbredykh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/libft.h"

void	ft_lstclear(t_list **lst, void (*del)(void*))
{
	t_list	*curr;
	t_list	*prev;

	prev = (t_list *)*lst;
	while (prev)
	{
		curr = prev->next;
		ft_lstdelone(prev, del);
		prev = curr;
	}
	*lst = 0;
}
